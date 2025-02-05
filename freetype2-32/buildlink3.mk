# $NetBSD: buildlink3.mk,v 1.47 2018/01/07 13:04:14 rillig Exp $

BUILDLINK_TREE+=	compat32_freetype2

.if !defined(COMPAT32_FREETYPE2_BUILDLINK3_MK)
COMPAT32_FREETYPE2_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.compat32_freetype2+=	compat32_freetype2>=2.4.5
BUILDLINK_ABI_DEPENDS.compat32_freetype2+=	compat32_freetype2>=2.4.11
BUILDLINK_PKGSRCDIR.compat32_freetype2?=	../../wip/freetype2-32
BUILDLINK_INCDIRS.compat32_freetype2?=		include/freetype2
BUILDLINK_LIBDIRS.compat32_freetype2?=		lib/32

BUILDLINK_FILES.compat32_freetype2+=	bin/freetype-config

FREETYPE_CONFIG?=	${BUILDLINK_PREFIX.freetype2}/bin/freetype-config
CONFIGURE_ENV+=		FREETYPE_CONFIG=${FREETYPE_CONFIG:Q}

.include "../../archivers/bzip2/buildlink3.mk"
.include "../../devel/zlib/buildlink3.mk"

# pkgbase := freetype2
# .include "../../mk/pkg-build-options.mk"

# .if !empty(PKG_BUILD_OPTIONS.freetype2:Mpng)
# CHECK_BUILTIN.freetype2:=	yes
# .include "../../graphics/freetype2/builtin.mk"
# CHECK_BUILTIN.freetype2:=	no

# .  if empty(USE_BUILTIN.freetype2:M[yY][eE][sS])
# .    include "../../graphics/png/buildlink3.mk"
# .  endif
# .endif

.endif # COMPAT32_FREETYPE2_BUILDLINK3_MK

BUILDLINK_TREE+=	-compat32_freetype2
