#include<bits/stdc++.h>
using namespace std;
int frame[]= {-1,-1,-1};
int frameSize=3;
int pgnum=20;
int dis[]= {0,0,0};
int curPos=0;
int curPg=0;
void printFrame()
{
    for(int i=frameSize-1; i>=0; i--)
        cout<<frame[i]<<" ";
    cout<<endl;
}
int main()
{
    int pages[]= {7,0,1,2,0,3,0,4,2,3,0,3,2,1,2,0,1,7,0,1};
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
            if(curPos==frameSize)
                curPos=0;
            printFrame();
            cnt++;
        }
        else
        {
            for(int j=0; j<frameSize; j++)
            {
                if(val==frame[j])
                {
                    switch(j)
                    {
                    case 0:
                    {

                        frame[0]=frame[1];
                        frame[1]=frame[2];
                        frame[2]=val;
                    }
                    break;
                    case 1:
                    {
                        swap(frame[1],frame[2]);

                    }
                    break;
                    case 2:
                        break;
                    };
                    printFrame();
                    curPg++;
                    cnt++;
                    flag=true;
                    break;
                }
            }
            if(flag)
            {
                flag=false;
                continue;
            }
            else
            {
                frame[0]=frame[1];
                frame[1]=frame[2];
                frame[2]=val;
                curPg++;
                printFrame();
                cnt++;

            }
        }
    }
}
