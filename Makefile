PREFIX	=${HOME}
BINDIR	=${PREFIX}/bin

SPREFIX	=/skiff
SHOME	=/home/skiff
SUDO	=sudo

all:	arm.zsh

arm.zsh: arm.zsh.in Makefile
	sed -e 's;<SPREFIX>;${SPREFIX};g' arm.zsh.in >$@
	chmod +x $@

.PHONY: install install-bin install-links

install: install-bin install-links

install-bin: arm.zsh
	install -d ${BINDIR}
	install -c arm.zsh ${BINDIR}/arm

install-links:
	${SUDO} ${RM} ${SPREFIX}
	${SUDO} ln -s ${SHOME} ${SPREFIX}

.PHONY:	uninstall uninstall-bin uninstall-links

uninstall: uninstall-bin uninstall-links

uninstall-bin:
	${SUDO} ${RM} ${BINDIR}/arm

uninstall-links:
	${SUDO} ${RM} ${SHOME}

.PHONY: clean distclean clobber

clean:
	${RM} hello.s *.o core.*

distclean clobber: clean
	${RM} arm.zsh

.PHONY:	check

check:	arm.zsh hello.c
	./arm.zsh make -f Makefile.arm hello.s
