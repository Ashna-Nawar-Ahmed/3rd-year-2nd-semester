#include<bits/stdc++.h>
using namespace std;
int frame[]={-1,-1,-1};
int frameSize=3;
int pgnum=20;
int curPos=0;
int curPg=0;
void printFrame()
{
    for(int i=0;i<frameSize;i++)
        cout<<frame[i]<<" ";
    cout<<endl;
}
int main()
{
    int pages[]={7,0,1,2,0,3,0,4,2,3,0,3,2,1,2,0,1,7,0,1};
    bool flag=false;
    int cnt=0;
    while(cnt!=pgnum)
    {
        int val=pages[curPg];
        cout<<"Currently serving:"<<val<<endl;
        if(frame[curPos]==-1)
        {
            frame[curPos]=val;
            curPg++;
            curPos++;
            if(curPos==3)
                curPos=0;
            printFrame();
            cnt++;
        }
        else
        {
            for(int j=0;j<frameSize;j++)
            {
                if(val==frame[j])
                {
                    printFrame();
                    curPg++;
                    cnt++;
                    flag=true;
                    break;
                }
            }
            if(!flag)
            {
                frame[curPos]=val;
                printFrame();
                curPg++;
                curPos++;
                if(curPos==3)
                curPos=0;
                cnt++;
            }
            else
            {
                flag=false;
                continue;
            }
        }
    }
}
