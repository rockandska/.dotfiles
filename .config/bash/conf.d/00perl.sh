PERL_MAJOR_VERSION=$(perl -e 'print $];' | sed 's/\..*//')
PERL_LIBPATH="${HOME:?}/.local/opt/perl${PERL_MAJOR_VERSION}"
# Configure perl locallib variables
read -r -d '' PERL_CONFIG <<- EOF || true
        PERL${PERL_MAJOR_VERSION}LIB="${PERL_LIBPATH:?}/lib/perl${PERL_MAJOR_VERSION}${PERL5LIB:+:${PERL5LIB}}"; export PERL${PERL_MAJOR_VERSION}LIB
        PERL_LOCAL_LIB_ROOT="${PERL_LIBPATH:?}${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT
        PERL_MB_OPT="--install_base \"${PERL_LIBPATH:?}\""; export PERL_MB_OPT
        PERL_MM_OPT="INSTALL_BASE=${PERL_LIBPATH:?}"; export PERL_MM_OPT                                                                                                                                                                  
        PATH="${PERL_LIBPATH:?}/bin:${PATH:?}"; export PATH
EOF

eval "${PERL_CONFIG}"

PERL_CPANM_HOME="~/.cache/cpanm"
