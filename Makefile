# $NetBSD: Makefile,v 1.31 2024/04/07 07:33:50 wiz Exp $

DISTNAME=		texttest-4.3.1
GITHUB_TAG=		${PKGVERSION_NOREV}
PKGNAME=		${DISTNAME:tl}
PKGREVISION=		2
CATEGORIES=		devel python
MASTER_SITES=		${MASTER_SITE_GITHUB:=texttest/}

MAINTAINER=		schmonz@NetBSD.org
HOMEPAGE=		http://texttest.sourceforge.net/
COMMENT=		Tool for text-based Approval Testing
LICENSE=		gnu-lgpl-v2.1

DEPENDS+=		${PYPKGPREFIX}-gobject3-[0-9]*:../../devel/py-gobject3
DEPENDS+=		${PYPKGPREFIX}-psutil-[0-9]*:../../sysutils/py-psutil

USE_LANGUAGES=		# none

REPLACE_PYTHON+=	texttestlib/default/batch/__init__.py
REPLACE_PYTHON+=	texttestlib/default/virtualdisplay.py
REPLACE_PYTHON+=	texttestlib/log/logconfiggen_setup.py

PYTHON_VERSIONS_INCOMPATIBLE=	27

SUBST_CLASSES+=		prefix
SUBST_STAGE.prefix=	pre-configure
SUBST_FILES.prefix=	texttestlib/default/__init__.py
SUBST_VARS.prefix=	PREFIX

.include "../../lang/python/egg.mk"
.include "../../lang/python/application.mk"
.include "../../x11/gtk3/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
