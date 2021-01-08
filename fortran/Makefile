FC	= gfortran-9
FFLAGS	= -O3

LIBS    = -llapack -lblas

#############
#############

EXPOKIT   = expokit.o
MATAID    = mataid.o

OBJS      = clock.o params.o $(EXPOKIT) $(MATAID) $(OBJLIBS)

all: lib

lib: libexpokit.a libexpokit.so.1.0.0

libexpokit.a:	$(OBJS)
	ar -crv $@ clock.o params.o $(EXPOKIT) $(MATAID) 

libexpokit.so.1.0.0:	$(OBJS)
	$(FC) -shared -Wl,-soname=libexpokit.so.1 -o $@ clock.o params.o $(EXPOKIT) $(MATAID) $(LIBS) 

sample_g: libexpokit.a sample_g.o
	$(FC) -o sample_g sample_g.o -L. -lexpokit $(LIBS)

sample_b: libexpokit.a sample_b.o
	$(FC) -o sample_b sample_b.o -L. -lexpokit $(LIBS)

sample_z: libexpokit.a sample_z.o
	$(FC) -o sample_z sample_z.o -L. -lexpokit $(LIBS)

sample_m: libexpokit.a sample_m.o
	$(FC) -o sample_m sample_m.o -L. -lexpokit $(LIBS)
 
sample_d: libexpokit.a sample_d.o
	$(FC) -o sample_d sample_d.o -L. -lexpokit $(LIBS)

sample_p: libexpokit.a sample_p.o
	$(FC) -o sample_p sample_p.o -L. -lexpokit $(LIBS)

check:	tests


tests:	
	make sample_g && ./sample_g
	make sample_b && ./sample_b
	make sample_z && ./sample_z
	make sample_m && ./sample_m
	make sample_d && ./sample_d
	make sample_p && ./sample_p

install:
	mkdir -p $(DESTDIR)/usr/lib
	mkdir -p $(DESTDIR)/usr/share/libexpokit/data
	mkdir -p $(DESTDIR)/usr/share/libexpokit/matlab
	mkdir -p $(DESTDIR)/usr/share/libexpokit/examples
	install -m 644 libexpokit.a $(DESTDIR)/usr/lib
	install -m 644 libexpokit.so.1.0.0 $(DESTDIR)/usr/lib
	cd $(DESTDIR)/usr/lib && ln -snf libexpokit.so.1.0.0 libexpokit.so.1
	cd $(DESTDIR)/usr/lib && ln -snf libexpokit.so.1.0.0 libexpokit.so 
	install -m 644 sample_*.f $(DESTDIR)/usr/share/libexpokit/examples
	install -m 644 ../data/* $(DESTDIR)/usr/share/libexpokit/data
	install -m 644 ../matlab/*.m $(DESTDIR)/usr/share/libexpokit/matlab
	
clean:
	rm -f *.o sample_[gbzmdp]
	
distclean:
	rm -f libexpokit.*
	
.f.o:;  $(FC) $(FFLAGS) -c $<
