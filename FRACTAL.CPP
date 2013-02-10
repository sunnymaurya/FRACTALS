#include <graphics.h>
#include <complex.h>
#include <stdio.h>
#include <conio.h>

#define X_MIN -3.0
#define X_MAX 3.0
#define Y_MIN -3.0
#define Y_MAX 3.0

#define ScrStepx (float)getmaxx()/MESHPTS
#define ScrStepy (float)getmaxy()/MESHPTS

#define MESHPTS 1000.

#define STEPX (X_MAX-X_MIN)/MESHPTS
#define STEPY (Y_MAX-Y_MIN)/MESHPTS

#define MAXITER 200

#define BIG 1.0e+7

#define MAX(a,b) ((a)>=(b)?(a):(b))


void main()
{
    int iter (complex z0);

    int gd=DETECT, gm;
    complex z0;

    initgraph(&gd,&gm,"C:\\TC\\BGI");

    for (int i=1; i<=MESHPTS+1; i++) {
      for (int j=1; j<=MESHPTS+1; j++) {
	 z0=complex(X_MIN+(i-1)*STEPX, Y_MIN+(j-1)*STEPY);
	 if (z0==complex(0,0)) continue;
	 putpixel((i-1)*ScrStepx,(j-1)*ScrStepy,iter(z0));
      }
    }

    getchar();

    closegraph();
}

int iter (complex c)
{
   complex z1=complex(0,0), z_0;

   z_0=c;

   for (int ctr=1; ctr<=MAXITER; ctr++) {

     //z1=z0-(pow(z0,4)-1)/(4*pow(z0,3));

    z1=pow(z_0,2)+c;

    if (abs(z1-z_0)>=BIG)
       return ctr;

     if (abs(z1-z_0)<0.001)
       return 0;

     z_0=z1;
   }
   return 0;
}
