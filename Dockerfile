# FROM scratch
# FROM debian:jessie
FROM buildpack-deps:jessie
MAINTAINER Andrew Babichev <andrew.babichev@gmail.com>

# Install rbenv
RUN git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
RUN echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
RUN echo 'eval "$(rbenv init -)"' >> ~/.bashrc

# Install ruby-build
RUN git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build

# Configure special environment variables
# https://github.com/sstephenson/ruby-build#special-environment-variables
ENV CONFIGURE_OPTS --disable-install-doc
