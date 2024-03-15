.PHONY: all
all:\
xmage-server

.PHONY: xmage-server
xmage-server:
	cd $@ && ${MAKE}

.PHONY: clean
clean:\
clean-xmage-server

.PHONY: clean-xmage-server
clean-xmage-server:
	cd xmage-server && ${MAKE} clean
