.POSIX:

INSTALL_LOCATION = ~/.lv2

CFLAGS = -fvisibility=hidden -fPIC -Wl,-Bstatic -Wl,-Bdynamic -Wl,--as-needed -shared -pthread `pkg-config --cflags lv2` -lm `pkg-config --libs lv2`

SRC = testamp.c
OBJ = testamp.so

all: clean ${OBJ}

${OBJ}:
	${CC} ${CFLAGS} ${SRC} -o ${OBJ}

clean:
	rm -f ${OBJ}

install:
	mkdir lv2amp
	mv *.ttl lv2amp
	cp -r lv2amp ${INSTALL_LOCATION}
