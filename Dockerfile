# syntax=docker/dockerfile:1.4
FROM rockylinux:8 AS build
COPY lustre-client-8.6.repo /etc/yum.repos.d/
RUN <<EOF
 dnf install -y lustre-client
 dnf clean all
 rm -rf /var/cache/yum
EOF

FROM rockylinux:8-minimal AS minimal
# Copy only over the necessasry lustre-client tools and dependencies
COPY --from=build /lib64/liblustreapi* /lib64/libnl-3* /lib64/libnl-genl* /lib64/liblnetconfig* /lib64/
COPY --from=build /usr/sbin/lctl /usr/sbin/lnetctl /usr/sbin/lst /usr/sbin/
COPY --from=build /usr/bin/lfs /usr/bin/

CMD ["/bin/bash"]
