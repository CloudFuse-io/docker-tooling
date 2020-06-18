build-amazonlinux1-gcc72:
	cd amazonlinux1/gcc72 && \
	docker build -t cloudfuse/amazonlinux1-builder:gcc72 .
