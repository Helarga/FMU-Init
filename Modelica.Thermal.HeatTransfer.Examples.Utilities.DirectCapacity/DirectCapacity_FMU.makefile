# FIXME: before you push into master...
RUNTIMEDIR=C:/Program Files/OpenModelica1.22.2-64bit/include/omc/c/
#COPY_RUNTIMEFILES=$(FMI_ME_OBJS:%= && (OMCFILE=% && cp $(RUNTIMEDIR)/$$OMCFILE.c $$OMCFILE.c))

fmu:
	rm -f DirectCapacity.fmutmp/sources/DirectCapacity_init.xml
	cp -a "C:/Program Files/OpenModelica1.22.2-64bit/share/omc/runtime/c/fmi/buildproject/"* DirectCapacity.fmutmp/sources
	cp -a DirectCapacity_FMU.libs DirectCapacity.fmutmp/sources/

