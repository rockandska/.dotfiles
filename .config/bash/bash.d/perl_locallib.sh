PERL5LIB="${HOME:?}/.local/opt/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="${HOME:?}/.local/opt/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"${HOME:?}/.local/opt/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=${HOME:?}/.local/opt/perl5"; export PERL_MM_OPT;
PATH="${HOME:?}/.local/opt/perl5/bin:${PATH:?}"; export PATH;
