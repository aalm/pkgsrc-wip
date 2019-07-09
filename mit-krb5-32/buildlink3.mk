# $NetBSD: buildlink3.mk,v 1.15 2018/06/15 20:46:01 tez Exp $

BUILDLINK_TREE+=	compat32_mit-krb5

.if !defined(MIT_KRB5_BUILDLINK3_MK)
MIT_KRB5_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.compat32_mit-krb5+=	compat32_mit-krb5>=1.4
BUILDLINK_PKGSRCDIR.compat32_mit-krb5?=		../../wip/mit-krb5-32
BUILDLINK_LIBDIRS.compat32_mit-krb5=		lib/32
.endif # MIT_KRB5_BUILDLINK3_MK

BUILDLINK_TREE+=	-compat32_mit-krb5
