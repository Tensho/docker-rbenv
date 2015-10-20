# Docker Rbenv Image
Docker image with rbenv and ruby-build

## Conclusion

After several talks with smart people I've finally realized and adopted that it's not normal to use docker with extra dependencies (rbenv). The final goal of docker is production fast delivery. Production environment requires minimal set of dependencies to work optimaly. To achive benefit of development/production parity from docker I should use THE SAME minimalistic resources. For instance, I should get bare ruby without any manager.

Also I've found confusing and unclear how docker, during image assembling, handles configuration setup from different standard configuration files, like `/etc/profile`, `~/.bashrc`, etc. Despite of it uses `/bin/sh` as legitimate default (because `sh` exists in every linux distro) for evey RUN command, it's really tricky to understand how to apply config stuff to subsequent RUN commands. I can't choose another shell in any standard way, but there is a hack for such purposes:
```
# Replace standard unix Bourne shell with Bourne Again shell
RUN rm /bin/sh && ln -s /bin/bash /bin/sh
```
As I understood the correct (and the only) way is manual config files loading before every command, if it requires something more complex than setting env vars (rbenv init):
```
RUN echo 'eval "$(rbenv init -)"' > /etc/profile.d/rbenv.sh
RUN source /etc/profile && echo $PATH
RUN echo $PATH
```
