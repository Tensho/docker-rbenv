# FROM scratch
# FROM debian:jessie
FROM buildpack-deps:jessie
MAINTAINER Andrew Babichev <andrew.babichev@gmail.com>

# Install rbenv and ruby-build
ENV RBENV_ROOT /root/.rbenv
RUN git clone https://github.com/sstephenson/rbenv.git $RBENV_ROOT
RUN git clone https://github.com/sstephenson/ruby-build.git $RBENV_ROOT/plugins/ruby-build
ENV PATH $RBENV_ROOT/bin:$PATH
RUN echo 'eval "$(rbenv init -)"' >> /etc/profile.d/rbenv.sh

# Configure special environment variables
# https://github.com/sstephenson/ruby-build#special-environment-variables
ENV CONFIGURE_OPTS --disable-install-doc
