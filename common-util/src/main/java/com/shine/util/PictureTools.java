package com.shine.util;

import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGImageEncoder;
import org.springframework.web.multipart.MultipartFile;

import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.*;

public class PictureTools {
    public static void reduceImg(String imgsrc, String imgdist) {
        int widthdist = 0;
        int heightdist = 0;
        try {
            File srcfile = new File(imgsrc);
            // 检查文件是否存在
            if (!srcfile.exists()) {
                return;
            }
            int[] results = getImgWidth(srcfile);
            if (results[0] > 1500) {
                widthdist = 1500;
                heightdist = results[1] * 1500 / results[0];
            } else {
                widthdist = results[0];
                heightdist = results[1];
            }
            // 开始读取文件并进行压缩
            Image src = javax.imageio.ImageIO.read(srcfile);
            BufferedImage tag = new BufferedImage(widthdist,
                    heightdist, BufferedImage.TYPE_INT_RGB);

            tag.getGraphics().drawImage(
                    src.getScaledInstance(widthdist, heightdist,
                            Image.SCALE_SMOOTH), 0, 0, null);

            FileOutputStream out = new FileOutputStream(imgdist);
            JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(out);
            encoder.encode(tag);
            out.close();

        } catch (IOException ex) {
            ex.printStackTrace();
        }
    }
    public static int[] getImgWidth(File file) {
        InputStream is = null;
        BufferedImage src = null;
        int result[] = { 0, 0 };
        try {
            is = new FileInputStream(file);
            src = javax.imageio.ImageIO.read(is);
            result[0] = src.getWidth(null); // 得到源图宽
            result[1] = src.getHeight(null); // 得到源图高
            is.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }
    public static void reduceImg(MultipartFile file, String imgdist) {
        int widthdist = 0;
        int heightdist = 0;
        try {
            int[] results = getImgWidth(file);
            if (results[0] > 1500) {
                widthdist = 1500;
                heightdist = results[1] * 1500 / results[0];
            } else {
                widthdist = results[0];
                heightdist = results[1];
            }
            // 开始读取文件并进行压缩
            Image src = javax.imageio.ImageIO.read(file.getInputStream());
            BufferedImage tag = new BufferedImage(widthdist,
                    heightdist, BufferedImage.TYPE_INT_RGB);
            tag.getGraphics().drawImage(
                    src.getScaledInstance(widthdist, heightdist,
                            Image.SCALE_SMOOTH), 0, 0, null);
            FileOutputStream out = new FileOutputStream(imgdist);
            JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(out);
            encoder.encode(tag);
            out.close();

        } catch (IOException ex) {
            ex.printStackTrace();
        }
    }
    private static int[] getImgWidth(MultipartFile file) {
        InputStream is = null;
        BufferedImage src = null;
        int result[] = { 0, 0 };
        try {
            is = file.getInputStream();
            src = javax.imageio.ImageIO.read(is);
            result[0] = src.getWidth(null); // 得到源图宽
            result[1] = src.getHeight(null); // 得到源图高
            is.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }
}
