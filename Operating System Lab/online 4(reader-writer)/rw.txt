/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package myreaderwriter;

import java.util.Scanner;
import java.util.Vector;
import java.util.concurrent.Semaphore;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author USER
 */
public class MyReaderWriter {
    static Semaphore readLock=new Semaphore(1);
    static Semaphore writeLock=new Semaphore(1);
    static int readerCount=0;
    static Scanner sc=new Scanner(System.in);
    static Vector<Integer> v=new Vector();
    
    //static int val=0;
    static class Write implements Runnable{

        @Override
        public void run() {
            try {
                writeLock.acquire();
                System.out.println("writer "+Thread.currentThread().getName()+" is writing");
                System.out.println("Enter a value:");
                int val=sc.nextInt();
                v.add(val);
                Thread.sleep(1500);
                for(int i=0;i<v.size();i++)
                    System.out.print(v.elementAt(i)+" ");
                System.out.println("");
                System.out.println("writer "+Thread.currentThread().getName()+" is leaving");
                writeLock.release();
            } catch (InterruptedException ex) {
                Logger.getLogger(MyReaderWriter.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
    }
    static class Read implements Runnable{

        @Override
        public void run() {
            try {
                readLock.acquire();
                readerCount++;
                if(readerCount==1){
                    writeLock.acquire();
                }
                readLock.release();
                int item=v.elementAt(0);
                v.removeElementAt(0);
                System.out.println("After removal:");
                for(int i=0;i<v.size();i++)
                    System.out.print(v.elementAt(i)+" ");
                Thread.sleep(2500);
                System.out.println("Reader "+Thread.currentThread().getName()+ " is reading: "+item);
                System.out.println("Reader "+Thread.currentThread().getName()+ " is finished reading");
                readLock.acquire();
                readerCount--;
                if(readerCount==0){
                    writeLock.release();
                }
                readLock.release();
            } catch (InterruptedException ex) {
                Logger.getLogger(MyReaderWriter.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
    }
    //Vector<int> v[]={1,5,3};
    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        v.add(15);
        v.add(25);
        v.add(35);
        v.add(45);
        v.add(55);
        Read r=new Read();
        Write w=new Write();
        Thread t1=new Thread(r);
        Thread t2=new Thread(w);
        Thread t3=new Thread(r);
        Thread t4=new Thread(w);
        t1.setName("1");
        t2.setName("1");
        t3.setName("2");
        t4.setName("2");
        System.out.println("Initial Values are:");
        for(int i=0;i<v.size();i++)
            System.out.print(v.elementAt(i)+" ");
        System.out.println("");
        t1.start();
        t2.start();
        t3.start();
        t4.start();
    }
    
}
