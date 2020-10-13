int a = 5;
int b = 6;
int *c = &a;

int main(void) {
  if (a < b) {
    b -= a;
  } else {
    a -= b;
  }
  *c = 10;
}
