FROM cloudfuse/amazonlinux1-builder:gcc72

ENV CLANG_VERSION 8.0.1

RUN git clone -b llvmorg-${CLANG_VERSION} --depth 1 https://github.com/llvm/llvm-project.git /source

RUN mkdir -p /source/build && \
  cd /source/build && \
  cmake -DLLVM_ENABLE_PROJECTS=clang -G "Unix Makefiles" ../llvm && \
  make
