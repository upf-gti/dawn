// Copyright 2022 The Dawn & Tint Authors
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//
// 1. Redistributions of source code must retain the above copyright notice, this
//    list of conditions and the following disclaimer.
//
// 2. Redistributions in binary form must reproduce the above copyright notice,
//    this list of conditions and the following disclaimer in the documentation
//    and/or other materials provided with the distribution.
//
// 3. Neither the name of the copyright holder nor the names of its
//    contributors may be used to endorse or promote products derived from
//    this software without specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
// AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
// IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
// DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
// FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
// DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
// SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
// CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
// OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
// OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

// Package expectations provides types and helpers for parsing, updating and
// writing WebGPU expectations files.
//
// See <dawn>/webgpu-cts/expectations.txt for more information.
package expectations

import (
	"fmt"
	"io"
	"os"
	"sort"
	"strings"

	"dawn.googlesource.com/dawn/tools/src/cts/result"
)

// Content holds the full content of an expectations file.
type Content struct {
	Chunks []Chunk
	Tags   Tags
}

// Chunk is an optional comment followed by a run of expectations.
// A chunk ends at the first blank line, or at the transition from an
// expectation to a line-comment.
type Chunk struct {
	Comments     []string     // Line comments at the top of the chunk
	Expectations Expectations // Expectations for the chunk
}

// Expectation holds a single expectation line
type Expectation struct {
	Line    int         // The 1-based line number of the expectation
	Bug     string      // The associated bug URL for this expectation
	Tags    result.Tags // Tags used to filter the expectation
	Query   string      // The CTS query
	Status  []string    // The expected result status
	Comment string      // Optional comment at end of line
}

// Expectations are a list of Expectation
type Expectations []Expectation

// Load loads the expectation file at 'path', returning a Content.
func Load(path string) (Content, error) {
	content, err := os.ReadFile(path)
	if err != nil {
		return Content{}, err
	}
	ex, err := Parse(path, string(content))
	if err != nil {
		return Content{}, err
	}
	return ex, nil
}

// Save saves the Content file to 'path'.
func (c Content) Save(path string) error {
	f, err := os.Create(path)
	if err != nil {
		return err
	}
	defer f.Close()

	return c.Write(f)
}

// Clone makes a deep-copy of the Content.
func (c Content) Clone() Content {
	chunks := make([]Chunk, len(c.Chunks))
	for i, c := range c.Chunks {
		chunks[i] = c.Clone()
	}
	return Content{chunks, c.Tags.Clone()}
}

// Empty returns true if the Content has no chunks.
func (c Content) Empty() bool {
	return len(c.Chunks) == 0
}

// Write writes the Content, in textual form, to the writer w.
func (c Content) Write(w io.Writer) error {
	for i, chunk := range c.Chunks {
		if i > 0 {
			if _, err := fmt.Fprintln(w); err != nil {
				return err
			}
		}
		for _, comment := range chunk.Comments {
			if _, err := fmt.Fprintln(w, comment); err != nil {
				return err
			}
		}
		for _, expectation := range chunk.Expectations {
			parts := []string{}
			if expectation.Bug != "" {
				parts = append(parts, expectation.Bug)
			}
			if len(expectation.Tags) > 0 {
				parts = append(parts, fmt.Sprintf("[ %v ]", strings.Join(expectation.Tags.List(), " ")))
			}
			parts = append(parts, expectation.Query)
			parts = append(parts, fmt.Sprintf("[ %v ]", strings.Join(expectation.Status, " ")))
			if expectation.Comment != "" {
				parts = append(parts, expectation.Comment)
			}
			if _, err := fmt.Fprintln(w, strings.Join(parts, " ")); err != nil {
				return err
			}
		}
	}
	return nil
}

// String returns the Content as a string.
func (c Content) String() string {
	sb := strings.Builder{}
	c.Write(&sb)
	return sb.String()
}

// Format sorts each chunk of the Content in place.
func (c *Content) Format() {
	for _, chunk := range c.Chunks {
		chunk.Expectations.Sort()
	}
}

// IsCommentOnly returns true if the Chunk contains comments and no expectations.
func (c Chunk) IsCommentOnly() bool {
	return len(c.Comments) > 0 && len(c.Expectations) == 0
}

// Clone returns a deep-copy of the Chunk
func (c Chunk) Clone() Chunk {
	comments := make([]string, len(c.Comments))
	for i, c := range c.Comments {
		comments[i] = c
	}
	expectations := make([]Expectation, len(c.Expectations))
	for i, e := range c.Expectations {
		expectations[i] = e.Clone()
	}
	return Chunk{comments, expectations}
}

// Clone makes a deep-copy of the Expectation.
func (e Expectation) Clone() Expectation {
	out := Expectation{
		Line:    e.Line,
		Bug:     e.Bug,
		Query:   e.Query,
		Comment: e.Comment,
	}
	if e.Tags != nil {
		out.Tags = e.Tags.Clone()
	}
	if e.Status != nil {
		out.Status = append([]string{}, e.Status...)
	}
	return out
}

// Compare compares the relative order of a and b, returning:
//
//	-1 if a should come before b
//	 1 if a should come after b
//	 0 if a and b are identical
//
// Note: Only comparing bug, tags, and query (in that order).
func (e Expectation) Compare(b Expectation) int {
	switch strings.Compare(e.Bug, b.Bug) {
	case -1:
		return -1
	case 1:
		return 1
	}
	switch strings.Compare(result.TagsToString(e.Tags), result.TagsToString(b.Tags)) {
	case -1:
		return -1
	case 1:
		return 1
	}
	switch strings.Compare(e.Query, b.Query) {
	case -1:
		return -1
	case 1:
		return 1
	}
	return 0
}

// Sort sorts the expectations in-place
func (e Expectations) Sort() {
	sort.Slice(e, func(i, j int) bool { return e[i].Compare(e[j]) < 0 })
}
