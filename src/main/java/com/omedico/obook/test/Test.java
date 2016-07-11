package com.omedico.obook.test;

import java.net.InetAddress;
import java.net.NetworkInterface;

public class Test {
  public static void main(String[] args) throws Exception {
    InetAddress addr = InetAddress.getLocalHost();

    NetworkInterface ni = NetworkInterface.getByInetAddress(addr);
    byte[] maca = ni.getHardwareAddress();

    for (int k = 0; k < maca.length; k++) {
      System.out.format("%02X%s", maca[k], (k < maca.length - 1) ? "-" : "");
    }
  }
}