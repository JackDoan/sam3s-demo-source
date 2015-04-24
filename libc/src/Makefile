##############################################################################
#
#
# Makefile for C2000 run-time support library version 6.4.2
#
#
##############################################################################
#
# This Makefile is automatically-generated: you usually should not edit it. 
#
##############################################################################


##############################################################################
#
# This Makefile is specific to compiler RTS library version 6.4.2.  
# The format is subject to change without notice.  This Makefile is intended
# for use with mklib, which understands which 'make' variables to set to build
# each distinct version of the RTS library.
#
# This Makefile uses GNU make language extensions.
#
##############################################################################

##############################################################################
#
# GROUPS
#
# The source files are set up in a modular fashion using "groups."  Groups
# represent major feature clusters, and usually specify source files which
# implement that feature.  When building a library which needs a particular
# feature, the group which represents that feature is "activated" by setting a
# 'make' variable.  This variable can be set directly by the user, or may be
# inferred from the setting of other variables.  Groups (and the files they
# contain) not needed for a certain library are not activated.  Some groups
# are always activated.  Groups which are not always activated are enclosed in
# an "ifeq" testing the corresponding 'make' variable (the name of the
# variable is the name of the group).
#
# Groups can specify any kind of source file (e.g. C, C++, assembly), but do
# not list header files, or source files included from other source files.
# This Makefile is focused on how to build the object files, not listing all
# of the necessary files.  Some groups do not list any source files; these
# groups may still carry information such as extra options to use when that
# group is active, or may activate other groups.  Some groups exist only to be
# tested as part of the activation condition of other groups.
#
# Groups can specify extra compiler options to use when that group is active.
# These can be options intended for all targets (UNIVERSAL_FLAGS), such as the
# CPU version, or can be intended only for a certain type of files (CPP_FLAGS)
# (e.g. the option "--exceptions")
#
##############################################################################

##############################################################################
#
# OPTIONS
#
# You can append or override some options through 'make' variables specified
# on the command line.  Not all options can be changed this way, and some
# options are dangerous to use in a Makefile (e.g. "--skip_assembler").
# Options added by groups below should not be altered; if the option is
# undesired, you're probably building the wrong library.  For example, if you
# don't want "--exceptions", you shouldn't be using EXCEPTIONS=1.
#
# You can append options to the standard list by using EXTRA_FLAGS.  This is
# useful for enabling debugging support or activating silicon errata
# workarounds:
#
# gmake LIB=some.lib EXTRA_FLAGS="-g"
#
# You can completely replace the standard list by using STANDARD_FLAGS, but
# this should almost never be necessary.  WARNING: This Makefile will not
# optimize the files if you replace the standard list and your replacement
# options do not include the right optimization flags.
#
# gmake LIB=some.lib STANDARD_FLAGS="-o3 -oe"
#
##############################################################################

##############################################################################
# Available libraries
#
# You can build each 6.4.2 library using the appropriate command:
#
# gmake library LIB=rts2800_fpu32.lib FPU32=1
# gmake library LIB=rts2800_fpu32_eh.lib FULL_PORTABLE_EH=1 FPU32=1 EXCEPTIONS=1
# gmake library LIB=rts2800_ml.lib LARGE=1
# gmake library LIB=rts2800_ml_eh.lib FULL_PORTABLE_EH=1 LARGE=1 EXCEPTIONS=1
##############################################################################

#-----------------------------------------------------------------------------
# Basic definitions
#-----------------------------------------------------------------------------
STANDARD_FLAGS =  -O --embed_icode --keep_asm --diag_warning=225 --quiet
ifeq (y,$(shell [ -e $(CGT_BIN)/cl2000 ] && echo y))
  CC = $(CGT_BIN)/cl2000
else
  CC = cl2000
endif
ifeq (y,$(shell [ -e $(CGT_BIN)/ar2000 ] && echo y))
  AR = $(CGT_BIN)/ar2000
else
  AR = ar2000
endif
CD = cd

OBJ = OBJ

#-----------------------------------------------------------------------------
# Group TARGET
#-----------------------------------------------------------------------------

TARGET_C_SOURCE = \
	ankmsg.c \
	cpy_tbl.c \
	ldexp.c \
	modf.c \
	sqrt.c \
	memcpy.c \
	abs.c \
	strspn.c \
	frexp.c

C_SOURCE += $(TARGET_C_SOURCE)


TARGET_ASM_SOURCE = \
	IQ.asm \
	IQxmpy.asm \
	abstract.asm \
	boot.asm \
	epilog.asm \
	fd_add.asm \
	fd_cmp.asm \
	fd_div.asm \
	fd_mpy.asm \
	fd_neg.asm \
	fd_sub.asm \
	fd_tofs.asm \
	fd_toi.asm \
	fd_tol.asm \
	fd_toll.asm \
	fd_tou.asm \
	fd_toul.asm \
	fd_toull.asm \
	fs_add.asm \
	fs_cmp.asm \
	fs_div.asm \
	fs_mpy.asm \
	fs_neg.asm \
	fs_tofd.asm \
	fs_toi.asm \
	fs_tol.asm \
	fs_toll.asm \
	fs_tou.asm \
	fs_toul.asm \
	fs_toull.asm \
	i_div.asm \
	i_tofd.asm \
	i_tofs.asm \
	l_div.asm \
	l_tofd.asm \
	l_tofs.asm \
	ll_abs.asm \
	ll_aox.asm \
	ll_cmp.asm \
	ll_div.asm \
	ll_mpy.asm \
	ll_tofd.asm \
	ll_tofs.asm \
	prolog.asm \
	setjmp.asm \
	u_div.asm \
	u_tofd.asm \
	u_tofs.asm \
	ul_tofd.asm \
	ul_tofs.asm \
	ull_tofd.asm \
	ull_tofs.asm \
	cpy_utils.asm \
	l_lsl.asm \
	l_lsr.asm \
	l_mpy.asm \
	ul_lsr.asm

ASM_SOURCE += $(TARGET_ASM_SOURCE)


#-----------------------------------------------------------------------------
# Group DINKUM_CPP
#-----------------------------------------------------------------------------

DINKUM_CPP_CPP_SOURCE = \
	fiopen.cpp \
	iomanip.cpp \
	ios.cpp \
	iostream.cpp \
	limits.cpp \
	locale.cpp \
	locale0.cpp \
	nothrow.cpp \
	raisehan.cpp \
	string.cpp \
	strstrea.cpp \
	throw.cpp \
	wiostrea.cpp \
	wlocale.cpp \
	xfpostox.cpp \
	xlocale.cpp \
	xlocinfo.cpp

CPP_SOURCE += $(DINKUM_CPP_CPP_SOURCE)


#-----------------------------------------------------------------------------
# Group GENERIC
#-----------------------------------------------------------------------------
UNIVERSAL_FLAGS += -c --ti_lib --keep_unneeded_types=false
CPP_FLAGS += -fg --rtti

#-----------------------------------------------------------------------------
# Group EXCEPTIONS
#-----------------------------------------------------------------------------
ifeq ($(EXCEPTIONS),1)
CPP_FLAGS += --exceptions
endif


#-----------------------------------------------------------------------------
# Group DINKUM_SUPPLEMENTAL_C
#-----------------------------------------------------------------------------

DINKUM_SUPPLEMENTAL_C_C_SOURCE = \
	signal.c \
	raise.c \
	fwide.c \
	stox.c

C_SOURCE += $(DINKUM_SUPPLEMENTAL_C_C_SOURCE)


DINKUM_SUPPLEMENTAL_C_CX0_SOURCE = \
	xatexit.cx0

CX0_SOURCE += $(DINKUM_SUPPLEMENTAL_C_CX0_SOURCE)


DINKUM_SUPPLEMENTAL_C_CX_SOURCE = \
	wchar.cx

CX_SOURCE += $(DINKUM_SUPPLEMENTAL_C_CX_SOURCE)


#-----------------------------------------------------------------------------
# Group C2800
#-----------------------------------------------------------------------------
UNIVERSAL_FLAGS += -v28

#-----------------------------------------------------------------------------
# Group GENERIC_EDG
#-----------------------------------------------------------------------------
GENERIC_EDG_C_FLAGS += --building_runtime
GENERIC_EDG_CPP_FLAGS += --building_runtime

GENERIC_EDG_CPP_SOURCE = \
	array_del.cpp \
	array_new.cpp \
	array_nodel.cpp \
	array_nonew.cpp \
	array_pdel.cpp \
	array_pnew.cpp \
	delete.cpp \
	delnothrow.cpp \
	dtor_list.cpp \
	error.cpp \
	guard.cpp \
	memzero.cpp \
	new_.cpp \
	newhandler.cpp \
	newnothrow.cpp \
	placedel.cpp \
	placenew.cpp \
	pure_virt.cpp \
	rtti.cpp \
	set_new.cpp \
	typeinfo_.cpp \
	vars.cpp \
	vec_cctor.cpp \
	vec_newdel.cpp \
	vla_alloc.cpp

#-----------------------------------------------------------------------------
# Group GENERIC_TI
#-----------------------------------------------------------------------------

GENERIC_TI_C_SOURCE = \
	ecvt.c \
	exit.c \
	fcvt.c \
	memory.c \
	_bufread.c \
	_data_synch.c \
	_io_perm.c \
	_lock.c \
	_mutex.c \
	_printfi.c \
	_printfi_min.c \
	_printfi_nf.c \
	_pthread.c \
	_scanfi.c \
	_scanfi_min.c \
	_scanfi_nf.c \
	_tvaltostr.c \
	args_main.c \
	asctime.c \
	assert.c \
	atexit.c \
	atof.c \
	atoi.c \
	atol.c \
	atoll.c \
	bcmp.c \
	bcopy.c \
	bsearch.c \
	bzero.c \
	clearerr.c \
	clock.c \
	ctime_.c \
	ctype.c \
	defs.c \
	difftime.c \
	errno.c \
	fclose.c \
	feof.c \
	ferror.c \
	fflush.c \
	ffs.c \
	fgetc.c \
	fgetpos.c \
	fgets.c \
	fopen.c \
	fprintf.c \
	fputc.c \
	fputs.c \
	fread.c \
	fscanf.c \
	fseek.c \
	fsetpos.c \
	ftell.c \
	fwrite.c \
	getenv.c \
	gmtime.c \
	imaxabs.c \
	imaxdiv.c \
	index.c \
	isalnum.c \
	isalpha.c \
	isascii.c \
	iscntrl.c \
	isdigit.c \
	isgraph.c \
	islower.c \
	isprint.c \
	ispunct.c \
	isspace.c \
	isupper.c \
	isxdigit.c \
	localtim.c \
	lowlev.c \
	ltoa.c \
	memccpy.c \
	memchr.c \
	memcmp.c \
	memmov.c \
	memset.c \
	mktime.c \
	multibyte.c \
	perror.c \
	printf.c \
	qsort.c \
	rand.c \
	remove.c \
	rewind.c \
	rindex.c \
	setbuf.c \
	setlocale.c \
	setvbuf.c \
	sinit.c \
	snprintf.c \
	sprintf.c \
	sscanf.c \
	strcasecmp.c \
	strcat.c \
	strchr.c \
	strcmp.c \
	strcoll.c \
	strcpy.c \
	strcspn.c \
	strdup.c \
	strerror.c \
	strftime.c \
	strlen.c \
	strncasecmp.c \
	strncat.c \
	strncmp.c \
	strncpy.c \
	strpbrk.c \
	strrchr.c \
	strstr.c \
	strtod.c \
	strtok.c \
	strtol.c \
	strtold.c \
	strtoll.c \
	strtoul.c \
	strtoull.c \
	strtoimax.c \
	strtoumax.c \
	strxfrm.c \
	time.c \
	tmpfile.c \
	tmpnam.c \
	tmzone.c \
	toascii.c \
	tolower.c \
	toupper.c \
	trgdrv.c \
	ungetc.c \
	vfprintf.c \
	vprintf.c \
	vsnprintf.c \
	vsprintf.c \
	wctype.c

C_SOURCE += $(GENERIC_TI_C_SOURCE)


#-----------------------------------------------------------------------------
# Group FPU32
#-----------------------------------------------------------------------------
ifeq ($(FPU32),1)
UNIVERSAL_FLAGS += --float_support=fpu32
endif


#-----------------------------------------------------------------------------
# Group TI_MATH
#-----------------------------------------------------------------------------

TI_MATH_C_SOURCE = \
	_log.c \
	acos.c \
	asin.c \
	atan.c \
	atan2.c \
	ceil.c \
	cos.c \
	cosh.c \
	div.c \
	exp.c \
	fabs.c \
	fmod.c \
	lldiv.c \
	log.c \
	log10.c \
	pow.c \
	sin.c \
	sinh.c \
	tan.c \
	tanh.c

C_SOURCE += $(TI_MATH_C_SOURCE)


#-----------------------------------------------------------------------------
# Group DINKUM_Y_HEADERS
#-----------------------------------------------------------------------------

#-----------------------------------------------------------------------------
# Group LARGE
#-----------------------------------------------------------------------------
ifeq ($(LARGE),1)
UNIVERSAL_FLAGS += -ml
endif


#-----------------------------------------------------------------------------
# Group FULL_PORTABLE_EH
#-----------------------------------------------------------------------------
ifeq ($(EXCEPTIONS),1)
FULL_PORTABLE_EH=1
endif

ifeq ($(FULL_PORTABLE_EH),1)
FULL_PORTABLE_EH_C_FLAGS += --building_runtime
FULL_PORTABLE_EH_CPP_FLAGS += --building_runtime

FULL_PORTABLE_EH_CPP_SOURCE = \
	eh_util.cpp \
	throw_edg.cpp
endif



FULL_PORTABLE_EH_CPP_OBJS_1 = $(patsubst %.cpp,$(OBJ)/%.obj,$(notdir $(FULL_PORTABLE_EH_CPP_SOURCE)))
$(FULL_PORTABLE_EH_CPP_OBJS_1): $(OBJ)/%.obj: %.cpp
	$(CC) $^ $(STANDARD_FLAGS) $(EXTRA_FLAGS) $(UNIVERSAL_FLAGS) $(FULL_PORTABLE_EH_FLAGS) $(CPP_FLAGS) $(FULL_PORTABLE_EH_CPP_FLAGS) -I$(INC) -fr $(OBJ) -fs $(OBJ) -ft $(OBJ)

GENERIC_EDG_CPP_OBJS_2 = $(patsubst %.cpp,$(OBJ)/%.obj,$(notdir $(GENERIC_EDG_CPP_SOURCE)))
$(GENERIC_EDG_CPP_OBJS_2): $(OBJ)/%.obj: %.cpp
	$(CC) $^ $(STANDARD_FLAGS) $(EXTRA_FLAGS) $(UNIVERSAL_FLAGS) $(GENERIC_EDG_FLAGS) $(CPP_FLAGS) $(GENERIC_EDG_CPP_FLAGS) -I$(INC) -fr $(OBJ) -fs $(OBJ) -ft $(OBJ)

CPP_OBJS_3 = $(patsubst %.cpp,$(OBJ)/%.obj,$(notdir $(CPP_SOURCE)))
$(CPP_OBJS_3): $(OBJ)/%.obj: %.cpp
	$(CC) $^ $(STANDARD_FLAGS) $(EXTRA_FLAGS) $(STANDARD_FLAGS) $(EXTRA_FLAGS) $(UNIVERSAL_FLAGS) $(UNIVERSAL_FLAGS) $(CPP_FLAGS) -I$(INC) -fr $(OBJ) -fs $(OBJ) -ft $(OBJ)

ASM_OBJS_4 = $(patsubst %.asm,$(OBJ)/%.obj,$(notdir $(ASM_SOURCE)))
$(ASM_OBJS_4): $(OBJ)/%.obj: %.asm
	$(CC) $^ $(STANDARD_FLAGS) $(EXTRA_FLAGS) $(STANDARD_FLAGS) $(EXTRA_FLAGS) $(UNIVERSAL_FLAGS) $(UNIVERSAL_FLAGS) $(C_FLAGS) -I$(INC) -fr $(OBJ) -fs $(OBJ) -ft $(OBJ)

C_OBJS_5 = $(patsubst %.c,$(OBJ)/%.obj,$(notdir $(C_SOURCE)))
$(C_OBJS_5): $(OBJ)/%.obj: %.c
	$(CC) $^ $(STANDARD_FLAGS) $(EXTRA_FLAGS) $(STANDARD_FLAGS) $(EXTRA_FLAGS) $(UNIVERSAL_FLAGS) $(UNIVERSAL_FLAGS) $(C_FLAGS) -I$(INC) -fr $(OBJ) -fs $(OBJ) -ft $(OBJ)

CX_OBJS_6 = $(patsubst %.cx,$(OBJ)/%.obj,$(notdir $(CX_SOURCE)))
$(CX_OBJS_6): $(OBJ)/%.obj: %.cx
	$(CC) $^ $(STANDARD_FLAGS) $(EXTRA_FLAGS) $(STANDARD_FLAGS) $(EXTRA_FLAGS) $(UNIVERSAL_FLAGS) $(UNIVERSAL_FLAGS) $(C_FLAGS) -I$(INC) -fr $(OBJ) -fs $(OBJ) -ft $(OBJ)

CX0_OBJS_7 = $(patsubst %.cx0,$(OBJ)/%.obj,$(notdir $(CX0_SOURCE)))
$(CX0_OBJS_7): $(OBJ)/%.obj: %.cx0
	$(CC) $^ $(STANDARD_FLAGS) $(EXTRA_FLAGS) $(STANDARD_FLAGS) $(EXTRA_FLAGS) $(UNIVERSAL_FLAGS) $(UNIVERSAL_FLAGS) $(C_FLAGS) -I$(INC) -fr $(OBJ) -fs $(OBJ) -ft $(OBJ)

library: $(FULL_PORTABLE_EH_CPP_OBJS_1) $(GENERIC_EDG_CPP_OBJS_2) $(CPP_OBJS_3) $(ASM_OBJS_4) $(C_OBJS_5) $(CX_OBJS_6) $(CX0_OBJS_7)
	$(CD) $(OBJ); $(AR) -qa $(LIB) *.obj

info:
	@echo FULL_PORTABLE_EH_CPP_OBJS_1 $(FULL_PORTABLE_EH_CPP_OBJS_1)
	@echo GENERIC_EDG_CPP_OBJS_2 $(GENERIC_EDG_CPP_OBJS_2)
	@echo CPP_OBJS_3 $(CPP_OBJS_3)
	@echo ASM_OBJS_4 $(ASM_OBJS_4)
	@echo C_OBJS_5 $(C_OBJS_5)
	@echo CX_OBJS_6 $(CX_OBJS_6)
	@echo CX0_OBJS_7 $(CX0_OBJS_7)
	@echo CPP_FLAGS $(CPP_FLAGS)
	@echo C_FLAGS $(C_FLAGS)
	@echo EXTRA_FLAGS $(EXTRA_FLAGS)
	@echo FULL_PORTABLE_EH_CPP_FLAGS $(FULL_PORTABLE_EH_CPP_FLAGS)
	@echo FULL_PORTABLE_EH_FLAGS $(FULL_PORTABLE_EH_FLAGS)
	@echo GENERIC_EDG_CPP_FLAGS $(GENERIC_EDG_CPP_FLAGS)
	@echo GENERIC_EDG_FLAGS $(GENERIC_EDG_FLAGS)
	@echo STANDARD_FLAGS $(STANDARD_FLAGS)
	@echo UNIVERSAL_FLAGS $(UNIVERSAL_FLAGS)
