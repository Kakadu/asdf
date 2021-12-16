#include <stdio.h>
#include <caml/mlvalues.h>

void margin (int n) {
  while (n-- > 0) printf(".");
}

void print_block (value v,int m)
{
  int size, i;
  margin(m);
  if (Is_long(v)) {
    printf("immediate value (%ld)\n", Long_val(v));
    return;
  };
  printf ("memory block: size=%d  -  ", size=Wosize_val(v));
  switch (Tag_val(v)) {
    case Closure_tag:
        printf("closure with %d free variables\n", size-1);
        // -1 because first is code pointer ?
        margin(m+4); printf("code pointer: %p\n", Code_val(v) );
        int arity = Int_val(  Field(v,1) );
        margin(m+4); printf("arity = %d\n", arity);
        int offset = (arity == 1) ? 0 : 1;
        for (i=2; i<size-offset; i++)
          print_block( Field(v,i+offset), m+4);
        break;
    case String_tag:
        printf("string: %s (%s)\n", String_val(v),(char *) v);
        break;
    case Double_tag:
        printf("float: %g\n", Double_val(v));
        break;
    case Double_array_tag :
        printf ("float array: ");
        for (i=0;i<size/Double_wosize;i++)  printf("  %g", Double_field(v,i));
        printf("\n");
        break;
    case Abstract_tag : printf("abstract type\n"); break;
    // case Final_tag : printf("abstract finalized type\n"); break;
    default:
        if (Tag_val(v)>=No_scan_tag) { printf("unknown tag"); break; };
        printf("structured block (tag=%d):\n",Tag_val(v));
        for (i=0;i<size;i++)  print_block(Field(v,i),m+4);
   }
  return ;
}

value inspect_block (value v)
  { print_block(v,4); fflush(stdout); return v; }
