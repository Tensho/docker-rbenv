# FROM scratch
# FROM debian:jessie
FROM buildpack-deps:jessie
MAINTAINER Andrew Babichev <andrew.babichev@gmail.com>

# Replace standard unix Bourne shell with Bourne Again shell
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# Install rbenv and ruby-build
RUN git clone https://github.com/sstephenson/rbenv.git      $HOME/.rbenv
RUN git clone https://github.com/sstephenson/ruby-build.git $HOME/.rbenv/plugins/ruby-build
RUN $HOME/.rbenv/plugins/ruby-build/install.sh
ENV PATH $HOME/.rbenv/bin:$HOME/.rbenv/shims:$PATH
RUN echo 'eval "$(rbenv init -)"' >> /etc/profile.d/rbenv.sh # or /etc/profile
RUN echo 'eval "$(rbenv init -)"' >> $HOME/.bashrc

# Configure special environment variables
# https://github.com/sstephenson/ruby-build#special-environment-variables
ENV CONFIGURE_OPTS --disable-install-doc
