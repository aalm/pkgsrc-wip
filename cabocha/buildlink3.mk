# $NetBSD: buildlink3.mk,v 1.1 2010/01/13 10:50:33 obache Exp $

BUILDLINK_TREE+=	cabocha

.if !defined(CABOCHA_BUILDLINK3_MK)
CABOCHA_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.cabocha+=	cabocha>=0.53
BUILDLINK_PKGSRCDIR.cabocha?=	../../wip/cabocha

.include "../../wip/yamcha/buildlink3.mk"
.endif	# CABOCHA_BUILDLINK3_MK

BUILDLINK_TREE+=	-cabocha
