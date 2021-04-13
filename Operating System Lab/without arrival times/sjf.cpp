#include<bits/stdc++.h>
using namespace std;
struct process{
    int pid;
    int cput;
    process(int p,int c){
        pid=p;
        cput=c;
    }
};
bool comp(process a,process b){
    return a.cput<b.cput;
}
int main()
{
    struct process arr[4]={{1,6},{2,8},{3,7},{4,3}};
    //struct process arr[3]={{1,5},{2,7},{3,9}};
    //printf("%d",arr[1].cput);
    int n=4;
    //int n=3;
    sort(arr,arr+n,comp);
    /*for(int i=0;i<n;i++)
        printf("%d\n",arr[i].cput);*/
    int wt[n],tat[n];
    int gantt[n];
    gantt[0]=arr[0].cput;
    for(int i=1;i<n;i++){
        int x=0;
        for(int j=0;j<=i;j++){
            x+=arr[j].cput;
        }
        gantt[i]=x;
    }
    printf("Gantt chart:\n");
    for(int i=0;i<n;i++){
        if(i==0)
            printf("0");
        //printf("P%d 0-%d\n",arr[0].pid,gantt[0]);
        for(int j=0;j<n;j++)
            printf("-");
        printf("%d",gantt[i]);
    }
    printf("\n");
    for(int i=0;i<n;i++)
    printf("   P%d",arr[i].pid);
    printf("\n");
    /*for(int i=1;i<n;i++)
        printf("P%d %d-%d\n",arr[i].pid,gantt[i-1],gantt[i]);*/

    for(int i=1;i<n;i++){
        wt[i]=gantt[i-1];
    }

    wt[0]=0;
    printf("\nWaiting times:\n");
    double a=0;
    for(int i=0;i<n;i++)
     {
         printf("P%d: %d\n",arr[i].pid,wt[i]);
         a+=wt[i];
     }
     a=a/n;
    printf("Average waiting time= %lf",a) ;

    tat[0]=arr[0].cput;
    for(int i=1;i<n;i++){
        tat[i]=gantt[i-1]+arr[i].cput;
    }
    printf("\n\nTurnaround times:");
    double b=0;
    for(int i=0;i<n;i++)
     {
         printf("P%d: %d\n",i+1,tat[i]);
         b+=tat[i];
     }
     b=b/n;
     printf("Average turnaround time= %lf",b) ;

}
