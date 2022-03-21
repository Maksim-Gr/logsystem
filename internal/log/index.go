package log

import (
	"os"

	"github.com/tysonmote/gommap"
)

var (
	offWidth = 4
	posWidth = 8
	endWidth = offWidth + posWidth
)

type index struct {
	file *os.File
	mmap gommap.MMap
}

// func newIndex(f *os.File, c Config) (*index, error) {

// }
