# $NetBSD: buildlink2.mk,v 1.2 2003/10/20 08:23:15 adrian_p Exp $

BUILDLINK_PACKAGES+=			libprelude
BUILDLINK_PKGBASE.libprelude+=		libprelude
BUILDLINK_DEPENDS.libprelude?=		libprelude>=0.8.7
BUILDLINK_PKGSRCDIR.libprelude?=	../../wip/libprelude

EVAL_PREFIX+=				BUILDLINK_PREFIX.libprelude=libprelude
BUILDLINK_PREFIX.libprelude_DEFAULT=	${LOCALBASE}
BUILDLINK_FILES.libprelude=		include/libprelude/*.h
BUILDLINK_FILES.libprelude+=		lib/libprelude.*

BUILDLINK_TARGETS+=	libprelude-buildlink

libprelude-buildlink: _BUILDLINK_USE
