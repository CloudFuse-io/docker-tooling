build-amazonlinux1-gcc72:
	cd amazonlinux1/gcc72 && \
	docker build -t cloudfuse/amazonlinux1-builder:gcc72 .

build-amazonlinux1-clang8:
	cd amazonlinux1/clang8 && \
	docker build -t cloudfuse/amazonlinux1-builder:clang8 .

build-amazonlinux1-clang6:
	cd amazonlinux1/clang6 && \
	docker build -t cloudfuse/amazonlinux1-builder:clang6 .
