OPT_DEST=$(srcdir)sys-root/opt/
DOWNLOAD_DEST=$(srcdir)download/

XMAGE_VERSION=1.4.51
XMAGE_UPDATE=2024-03-02_11-41
XMAGE_FILE=mage-full_${XMAGE_VERSION}-dev_${XMAGE_UPDATE}.zip
XMAGE_DEST=${OPT_DEST}xmage/

JRE_VERSION=1.8.0
JRE_UPDATE=201
JAVA_VER=8u201
JRE_FILE=jre-${JAVA_VER}-linux-x64.tar.gz
JRE_DEST=${XMAGE_DEST}java/


.PHONY: all
all:\
build-image

.PHONY: build-image
build-image:\
${XMAGE_DEST}\
${JRE_DEST}\
${XMAGE_DEST}installed.properties\
${XMAGE_DEST}xmage/mage-server/config/config.xml
	podman build . -t "xmage-server:${XMAGE_VERSION}-${XMAGE_UPDATE}"

${XMAGE_DEST}:\
${DOWNLOAD_DEST}${XMAGE_FILE}
	mkdir -p $@
	touch $@
	7z x -aoa  -o$@ $<

${JRE_DEST}:\
${DOWNLOAD_DEST}${JRE_FILE}\
${XMAGE_DEST}
	mkdir -p $@
	touch $@
	tar xf $< -C $@

${XMAGE_DEST}installed.properties:\
	${XMAGE_DEST}
	echo -e "\njava.version=${JRE_VERSION}_${JRE_UPDATE}" >> $@


${XMAGE_DEST}xmage/mage-server/config/config.xml:\
	${XMAGE_DEST}
	sed -i 's/secondaryBindPort="-1"/secondaryBindPort="17172"/g' $@

${DOWNLOAD_DEST}${JRE_FILE}:\
${DOWNLOAD_DEST}
	curl -s -o $@ http://xmage.today/java/${JRE_FILE}

${DOWNLOAD_DEST}${XMAGE_FILE}:\
${DOWNLOAD_DEST}
	curl -s -o $@ http://xmage.today/files/${XMAGE_FILE}

${DOWNLOAD_DEST}:
	mkdir $@

.PHONY = clean
clean:\
clean-download\
clean-sys-root

.PHONY = clean-download
clean-download:
	rm -rf download

.PHONY = clean-sys-root
clean-sys-root:
	rm -rf sys-root
