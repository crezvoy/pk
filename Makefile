
all:

test_cases=$(subst t/,,$(subst .sh,,$(wildcard t/*.sh)))
interactive-cases=$(subst t/,,$(subst .run,,$(wildcard t/*.run)))

ifndef $(TEST_SHELL)
TEST_SHELL=$(SHELL)
endif

.PHONY: $(test_cases)
$(test_cases): %: t/%.sh hsh t/testenv
	@printf "%-28s" "$@"
	@t/testenv $(TEST_SHELL) $< >$@.err 2>&1; \
	if [ $$? = 0 ]; then \
		printf ' \033[32m✔\033[0m\n'; \
	    rm "$@.err"; \
		true; \
 	else \
		printf ' \033[31m✘\033[0m\n'; \
		cat "$@.err"; \
	    rm "$@.err"; \
		false; \
	fi

.PHONY: bash-completion
bash-completion: t/bash-completion hsh t/testenv
	@printf "%-28s" "$@"
	@bash t/testenv bash t/bash-completion >$@.err 2>&1; \
	if [ $$? = 0 ]; then \
		printf ' \033[32m✔\033[0m\n'; \
	    rm "$@.err"; \
		true; \
 	else \
		printf ' \033[31m✘\033[0m\n'; \
		cat "$@.err"; \
	    rm "$@.err"; \
		false; \
	fi
	
.PHONY: $(interactive_cases)
$(interactive_cases): %: t/%.run hsh t/testenv
	@printf "%-28s" "$@"
	@t/testenv $(TEST_SHELL) $< >$@.err 2>&1; \
	if [ $$? = 0 ]; then \
		printf ' \033[32m✔\033[0m\n'; \
	    rm "$@.err"; \
		true; \
	else \
		printf ' \033[31m✘\033[0m\n'; \
		cat "$@.err"; \
	    rm "$@.err"; \
		false; \
	fi

.PHONY: check
check: $(test_cases) bash-completion

.PHONY: interactive-check
interactive-check: $(interactive-cases)


.PHONY: clean
clean:
	@-echo "cleanup"
	@-rm *.err 2>/dev/null

deps=$(wildcard src/*.d)
-include $(deps)
