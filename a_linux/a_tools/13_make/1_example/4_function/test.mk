
md5s() {
	cat "$@" | (
		md5sum 2>/dev/null ||
		md5
	) | awk '{print $1}'
}

all::
	@echo find . -name if | md5s
