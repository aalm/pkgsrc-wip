# $NetBSD: Makefile,v 1.100 2019/05/06 08:20:32 wiz Exp $

DISTNAME=	krb5-1.16.2
ABI?=		32
PKGNAME=	compat${ABI}_mit-${DISTNAME}
PKGREVISION=	1
CATEGORIES=	security
MASTER_SITES=	http://web.mit.edu/kerberos/dist/krb5/${PKGVERSION_NOREV:R}/

MAINTAINER=	tez@NetBSD.org
HOMEPAGE=	http://web.mit.edu/kerberos/
COMMENT=	MIT Kerberos 5 authentication system

MAKE_JOBS_SAFE=		no
LIBABISUFFIX?=		/32
CONFIGURE_ARGS+=        --libdir=${PREFIX}/lib${LIBABISUFFIX}
#CONFIGURE_ARGS+=        --bindir=${PREFIX}/lib${LIBABISUFFIX}
#CONFIGURE_ARGS+=        --includedir=${PREFIX}/lib${LIBABISUFFIX}
CFLAGS+=                -m32

WRKSRC=		${WRKDIR}/${DISTNAME}/src

BUILD_TARGET=	generate-files-mac all

.include "../../mk/bsd.prefs.mk"

CONFLICTS+=	heimdal-[0-9]*
CONFLICTS+=	kth-krb4-[0-9]*

USE_LANGUAGES=		c c++
USE_LIBTOOL=		yes
GNU_CONFIGURE=		yes
USE_TOOLS+=		autoconf gzip m4 msgfmt perl
.if ${OPSYS} == "SunOS"
USE_TOOLS+=		bison
.else
USE_TOOLS+=		yacc
.endif

# The actual KDC databases are stored in ${MIT_KRB5_STATEDIR}/krb5kdc.
MIT_KRB5_STATEDIR?=	${VARBASE}
FILES_SUBST+=		MIT_KRB5_STATEDIR=${MIT_KRB5_STATEDIR}

BUILD_DEFS+=		VARBASE

CONFIGURE_ARGS+=	--localstatedir=${MIT_KRB5_STATEDIR}
CONFIGURE_ARGS+=	--sysconfdir=${PKG_SYSCONFDIR}
CONFIGURE_ARGS+=	--enable-shared
CONFIGURE_ARGS+=	--enable-dns-for-realm
CONFIGURE_ARGS+=	--disable-kdc-lookaside-cache
CONFIGURE_ARGS+=	--disable-thread-support
CONFIGURE_ARGS+=	--without-tcl
CONFIGURE_ARGS+=	--enable-pkgsrc-libtool
CONFIGURE_ARGS+=	--without-system-verto
CONFIGURE_ARGS+=	--disable-aesni
CONFIGURE_ENV+=		BUILDLINK_PREFIX_OPENSSL=${BUILDLINK_PREFIX.openssl}
CONFIGURE_ENV+=		DEFKTNAME=FILE:${PKG_SYSCONFDIR}/krb5.keytab
MAKE_ENV+=		ROOT_USER=${ROOT_USER}
LIBS.SunOS=		-lrt

PATCH_DIST_ARGS=	-d ${WRKSRC} -p2

INFO_FILES=		YES

OWN_DIRS_PERMS=		${MIT_KRB5_STATEDIR}/krb5kdc			\
			${REAL_ROOT_USER} ${REAL_ROOT_GROUP} 0700
#RCD_SCRIPTS=		kadmind kdc

INSTALLATION_DIRS=	bin include/gssapi include/gssrpc ${PKGINFODIR}	\
			${PKGMANDIR}/man1 ${PKGMANDIR}/man5		\
			${PKGMANDIR}/man7 ${PKGMANDIR}/man8		\
			sbin share/examples/krb5 share/et		\
			share/examples/rc.d share/gnats			\
			lib/32/krb5/plugins/kdb lib/32/krb5/plugins/preauth	\
			lib/32/krb5/plugins/tls include/krb5 include/kadm5 \
			lib/32/pkgconfig

pre-configure:
	cd ${WRKSRC} && autoconf -I ${WRKSRC} -f

# pre-install:
# 	find ${DESTDIR}${PREFIX} -path ${DESTDIR}${PREFIX}/lib${LIBABISUFFIX} \
# 	-prune -o -type f -exec ${RM} {} +

remove-non-libs:
	echo "Removing non-compat lib package content"
	find ${DESTDIR}${PREFIX} -path ${DESTDIR}${PREFIX}/lib${LIBABISUFFIX} -prune -or -type f -exec ${RM} {} +

post-install: remove-non-libs
	# cd ${WRKDIR}/${DISTNAME}/doc;					\
	# for f in *.info *.info-[0-9]*; do				\
	# 	${TEST} ! -f "$$f" ||					\
	# 	${INSTALL_MAN} "$$f" ${DESTDIR}${PREFIX}/${PKGINFODIR};	\
	# done

BUILDLINK_API_DEPENDS.openssl+= openssl>=1.0.1
.include "../../security/openssl/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
