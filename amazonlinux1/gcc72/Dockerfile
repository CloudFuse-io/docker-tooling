# use lambda CI because official amazonlinux:1 image does not seem very accurate
FROM lambci/lambda-base:latest

ENV PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/bin

# We inspire ourself from the lambci docker-lambda base/build image
RUN chmod 1777 /tmp && \
  /usr/bin/python3 -c "from configparser import SafeConfigParser; \
yum_conf = SafeConfigParser(); \
yum_conf.read('/etc/yum.conf'); \
yum_conf.has_section('main') or yum_conf.add_section('main'); \
yum_conf.set('main', 'plugins', '1'); \
f = open('/etc/yum.conf', 'w'); \
yum_conf.write(f); \
f.close();" && \
  rpm --rebuilddb && \
  yum install -y yum-plugin-ovl && \
  yum reinstall -y setup pam shadow-utils audit-libs openssl glibc-common glibc && \
  yum groupinstall -y development && \
  yum install -y \
    curl-devel \
    gcc72 \
    gcc72-c++ \
    git \
    ninja-build \
    openssl-devel && \
  yum clean all && \
  rm -rf /var/cache/yum

# download a *recent* version of cmake from cmake.org
ENV CMAKE_VERSION_MAJOR 3.17
ENV CMAKE_VERSION 3.17.1

RUN curl https://cmake.org/files/v${CMAKE_VERSION_MAJOR}/cmake-${CMAKE_VERSION}-Linux-x86_64.tar.gz --output cmake-${CMAKE_VERSION}-Linux-x86_64.tar.gz && \
  tar -zxvf cmake-${CMAKE_VERSION}-Linux-x86_64.tar.gz && \
  mv cmake-${CMAKE_VERSION}-Linux-x86_64 /opt && \
  rm cmake-${CMAKE_VERSION}-Linux-x86_64.tar.gz && \
  ln -s /opt/cmake-${CMAKE_VERSION}-Linux-x86_64/bin/cmake /usr/local/bin/cmake && \
  ln -s /opt/cmake-${CMAKE_VERSION}-Linux-x86_64/bin/ctest /usr/local/bin/ctest
