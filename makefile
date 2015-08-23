IDIR = ./src/include
ODIR = ./obj
LDIR = ./lib
SRC = ./src
BIN = ./bin

CC = gcc
CFLAGS = -I$(IDIR)
LIBS = -lm

_DEPS = solver.h
DEPS = $(patsubst %,$(IDIR)/%,$(_DEPS))

_OBJ = main.o solver.o
OBJ = $(patsubst %,$(ODIR)/%,$(_OBJ))

$(ODIR)/%.o: $(SRC)/%.c $(DEPS)
	mkdir -p $(ODIR)
	$(CC) -c -o $@ $< $(CFLAGS)

main: $(OBJ)
	mkdir -p $(BIN)
	gcc -o $(BIN)/$@ $^ $(CFLAGS) $(LIBS)

.PHONY: clean

clean:
	rm -f $(ODIR)/*.o *~ core $(INCDIR)/*~
