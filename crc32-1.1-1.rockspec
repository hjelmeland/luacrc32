package = "crc32"

version = "1.1-1"

source = {
	url = "git://github.com/hjelmeland/luacrc32",
	tag = "1.1",
}

description = {
	summary = "CRC-32 module implemented in C",
	license = "MIT",
	homepage = "https://github.com/hjelmeland/luacrc32",
}

dependencies = {
	"lua >= 5.1, < 5.4"
}

build = {
	type = "builtin",
	modules = {
		crc32 = { "crc32.c", "wrap.c"}
	}
}
