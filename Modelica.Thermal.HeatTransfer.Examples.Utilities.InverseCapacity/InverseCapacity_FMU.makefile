# FIXME: before you push into master...
RUNTIMEDIR=C:/Program Files/OpenModelica1.22.2-64bit/include/omc/c/
#COPY_RUNTIMEFILES=$(FMI_ME_OBJS:%= && (OMCFILE=% && cp $(RUNTIMEDIR)/$$OMCFILE.c $$OMCFILE.c))

fmu:
	rm -f InverseCapacity.fmutmp/sources/InverseCapacity_init.xml
	cp -a "C:/Program Files/OpenModelica1.22.2-64bit/share/omc/runtime/c/fmi/buildproject/"* InverseCapacity.fmutmp/sources
	cp -a InverseCapacity_FMU.libs InverseCapacity.fmutmp/sources/

