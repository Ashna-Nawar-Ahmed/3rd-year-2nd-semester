/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package rag;

import java.util.Scanner;
import java.util.Vector;

/**
 *
 * @author USER
 */
public class RAG {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        Scanner sc=new Scanner(System.in);
        Vector<Vector<Node> > v=new Vector();
        int nodes,edges;
        System.out.println("Enter number of nodes and edges:");
        nodes=sc.nextInt();
        edges=sc.nextInt();
        System.out.println("Enter nodes");
        char ar[]=new char[100];
        for(int i=0;i<nodes;i++){
            //ar[i]=(char)sc.next();
            //char x=Character.
            //v[i].add(sc.next());
        }
    }
    
}
class Node{
    char a;
}
