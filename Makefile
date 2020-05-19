X86_SDK ?= ../../../SDK/OpenWrt-SDK-x86
X64_SDK ?= ../../../SDK/OpenWrt-SDK-x86_64

CC := $(CROSS_COMPILE)gcc
HEADERS :=
CFLAGS += -Iinclude -Igsoap -Ionvifgen -DWITH_OPENSSL -DWITH_DOM -DWITH_PURE_VIRTUAL -Wall -fPIC
LDFLAGS += -lssl -lcrypto -lstdc++ -fPIC

onvifclient: onvifclient.o \
	gsoap/dom.o gsoap/duration.o gsoap/mecevp.o gsoap/smdevp.o gsoap/stdsoap2.o \
	gsoap/threads.o gsoap/wsaapi.o gsoap/wsseapi.o \
	onvifgen/nsmap.o onvifgen/soapC.o onvifgen/soapDeviceBindingProxy.o \
	onvifgen/soapDeviceBindingService.o onvifgen/soapDeviceIOBindingProxy.o \
	onvifgen/soapDeviceIOBindingService.o onvifgen/soapDisplayBindingProxy.o \
	onvifgen/soapDisplayBindingService.o onvifgen/soapImagingBindingProxy.o \
	onvifgen/soapImagingBindingService.o onvifgen/soapMediaBindingProxy.o \
	onvifgen/soapMediaBindingService.o onvifgen/soapPTZBindingProxy.o \
	onvifgen/soapPTZBindingService.o onvifgen/soapPullPointSubscriptionBindingProxy.o \
	onvifgen/soapPullPointSubscriptionBindingService.o onvifgen/soapReceiverBindingProxy.o \
	onvifgen/soapReceiverBindingService.o onvifgen/soapRecordingBindingProxy.o \
	onvifgen/soapRecordingBindingService.o onvifgen/soapRemoteDiscoveryBindingProxy.o \
	onvifgen/soapRemoteDiscoveryBindingService.o onvifgen/soapReplayBindingProxy.o \
	onvifgen/soapReplayBindingService.o onvifgen/soapSearchBindingProxy.o \
	onvifgen/soapSearchBindingService.o onvifgen/soapwsddProxy.o onvifgen/soapwsddService.o
	$(CC) $^ -o $@ $(LDFLAGS)

%.o: %.cpp $(HEADERS)
	$(CC) -c $< -o $@ $(CFLAGS)

clean:
	rm -f *.o gsoap/*.o onvifgen/*.o onvifclient

.PHONY:
