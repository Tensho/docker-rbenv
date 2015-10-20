# FROM scratch
# FROM debian:jessie
FROM buildpack-deps:jessie
MAINTAINER Andrew Babichev <andrew.babichev@gmail.com>

# Replace standard unix Bourne shell with Bourne Again shell
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# Install rbenv and ruby-build
RUN echo $SHELL
ENV RBENV_ROOT /root/.rbenv
RUN git clone https://github.com/sstephenson/rbenv.git $RBENV_ROOT
RUN git clone https://github.com/sstephenson/ruby-build.git $RBENV_ROOT/plugins/ruby-build
# ENV PATH $RBENV_ROOT/shims:$PATH
ENV PATH $RBENV_ROOT/bin:$PATH
RUN echo 'eval "$(rbenv init -)"' > /etc/profile.d/rbenv.sh
# I can see shims in PATH added by rbenv init only with source appending
RUN source /etc/profile && echo $PATH
# I can't see shims in PATH immidietly after previous command
RUN echo $PATH

# Configure special environment variables
# https://github.com/sstephenson/ruby-build#special-environment-variables
ENV CONFIGURE_OPTS --disable-install-doc
