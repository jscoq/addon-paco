REPO = https://github.com/snu-sf/paco.git
TAG = v4.1.2
WORKDIR = workdir

.PHONY: all get

all: $(WORKDIR)
	dune build

get: $(WORKDIR)

$(WORKDIR):
	git clone --depth=1 --no-checkout -b $(TAG) $(REPO) $(WORKDIR)
	( cd $(WORKDIR) && git checkout $(TAG) )
	cp -r dune-files/* $(WORKDIR)/

install:
	dune install coq-paco
