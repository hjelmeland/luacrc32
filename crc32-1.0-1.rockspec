package = "crc32"

version = "1.0-1"

source = {
	url = "https://github.com/hjelmeland/luacrc32",
}

description = {
	summary = "CRC32 module implemented in C",
	license = "MIT/X11",
	homepage = "https://github.com/hjelmeland/luacrc32",
}

dependencies = {
	"lua >= 5.1, < 5.2"
}

build = {
	type = "builtin",
	modules = {
		crc32 = { "crc32.c", "wrap.c"}
	}
}
