extra_files=LICENSE
extra_dirs=ajax

# Include standard app makefile targets provided by core
include ../../build/rules/help.mk
include ../../build/rules/dist.mk
include ../../build/rules/test-acceptance.mk
include ../../build/rules/test-js.mk
include ../../build/rules/test-php.mk
include ../../build/rules/clean.mk
