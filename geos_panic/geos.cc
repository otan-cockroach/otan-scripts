#include <geos_c.h>
#include <string>

using namespace std;

void geos_message_handler(const char *fmt, ...) {}
void geos_error_handler(const char *fmt, ...) {}

int main() {
  string aEWKB = "01020000000200000000000000000000000000000000000000000000000000F03F0000000000000000";
  string bEWKB = "0107000000010000000106000000010000000103000000010000000500000008690b3a70a9c347540a11d15993eec7e04b9e4d8fd2cb4702907c2929abe847d02aef5652e3cec72c1b57867da3dd47bbf47698d501eac7ccc0d287b380d44708690b3a70a9c347540a11d15993eec7";

  initGEOS(&geos_message_handler, &geos_error_handler);

  auto wkbReader = GEOSWKBReader_create();
  auto geomA = GEOSWKBReader_read(wkbReader, reinterpret_cast<const unsigned char*>(aEWKB.data()), aEWKB.length());
  auto geomB = GEOSWKBReader_read(wkbReader, reinterpret_cast<const unsigned char*>(bEWKB.data()), bEWKB.length());
  GEOSIntersects(geomA, geomB);
  return 0;
}
