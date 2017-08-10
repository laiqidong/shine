package com.shine.ysl.controller;


import com.shine.model.ysl.DocumentDownload;
import com.shine.repository.front.DocumentDownloadRepository;
import com.shine.repository.front.DownloadTypeRepository;
import org.apache.poi.hwpf.HWPFDocument;
import org.apache.poi.hwpf.converter.PicturesManager;
import org.apache.poi.hwpf.converter.WordToHtmlConverter;
import org.apache.poi.hwpf.usermodel.Picture;
import org.apache.poi.hwpf.usermodel.PictureType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.w3c.dom.Document;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import java.io.*;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.util.List;

@Controller
@RequestMapping("wsDownload")
public class WSDownloadController {
    @Resource
    private DownloadTypeRepository downloadTypeRepository;
    @Resource
    private DocumentDownloadRepository documentDownloadRepository;

    @RequestMapping("/getWordPreview/{id}")
    public String getWordPreview(@PathVariable Integer id, Model model) throws ParserConfigurationException, IOException, TransformerException {
        DocumentDownload documentDownload = documentDownloadRepository.findOne(id);
//        String fileName = "D:\\2.doc";
        String fileName = documentDownload.getAddress();
        try {
            HWPFDocument wordDocument = new HWPFDocument(new FileInputStream(fileName));
            WordToHtmlConverter wordToHtmlConverter = new WordToHtmlConverter(
                    DocumentBuilderFactory.newInstance().newDocumentBuilder()
                            .newDocument());
            wordToHtmlConverter.setPicturesManager(new PicturesManager() {
                public String savePicture(byte[] content,
                                          PictureType pictureType, String suggestedName,
                                          float widthInches, float heightInches) {
                    return "test/" + suggestedName;
                }
            });
            wordToHtmlConverter.processDocument(wordDocument);
            //save pictures
            List pics = wordDocument.getPicturesTable().getAllPictures();
            if (pics != null) {
                for (int i = 0; i < pics.size(); i++) {
                    Picture pic = (Picture) pics.get(i);
                    System.out.println();
                    try {
                        pic.writeImageContent(new FileOutputStream("D:/test/"
                                + pic.suggestFullFileName()));
                    } catch (FileNotFoundException e) {
                        e.printStackTrace();
                        model.addAttribute("msg","文件不存在");
                        return "error/error";
                    }
                }
            }
            Document htmlDocument = wordToHtmlConverter.getDocument();
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            DOMSource domSource = new DOMSource(htmlDocument);
            StreamResult streamResult = new StreamResult(out);

            TransformerFactory tf = TransformerFactory.newInstance();
            Transformer serializer = tf.newTransformer();
            serializer.setOutputProperty(OutputKeys.ENCODING, "GB2312");
            serializer.setOutputProperty(OutputKeys.INDENT, "yes");
            serializer.setOutputProperty(OutputKeys.METHOD, "HTML");
            serializer.transform(domSource, streamResult);
            out.close();
            model.addAttribute("content", new String(out.toByteArray()));
            return "front/download/word";
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("msg","文件不存在");
            return "error/error";
        }

    }

    @RequestMapping("download/{id}")
    public String download(@PathVariable Integer id, HttpServletResponse response, HttpServletRequest request) throws IOException {
        DocumentDownload documentDownload = documentDownloadRepository.findOne(id);
//        String fileName = "D:\\2.doc";
        String address = documentDownload.getAddress();
        File file = new File(address);
        //判断文件是否存在
        if (!file.exists()) {
            request.setAttribute("msg","文件不存在");
            return "error/error";
        }
        //判断文件类型
        String mimeType = URLConnection.guessContentTypeFromName(file.getName());
        if (mimeType == null) {
            mimeType = "application/octet-stream";
        }
        response.setContentType(mimeType);
        //文件名编码，解决乱码问题
        String fileName = file.getName();
        String encodedFileName = URLEncoder.encode(fileName, "utf-8").replaceAll("\\+", "%20");
        //设置Content-Disposition响应头，一方面可以指定下载的文件名，另一方面可以引导浏览器弹出文件下载窗口
        response.setHeader("Content-Disposition", "attachment;fileName=\"" + encodedFileName + "\"");

        //文件下载
        InputStream in = new BufferedInputStream(new FileInputStream(file));
        FileCopyUtils.copy(in, response.getOutputStream());
        return null;
    }

    @RequestMapping("downTypes")
    @ResponseBody
    public Object getDownloadTypes() {
        return downloadTypeRepository.findByStatus(1);

    }

    @RequestMapping("documents/{typeId}")
    @ResponseBody
    public Object getDocuments(@PathVariable Integer typeId) {
        return documentDownloadRepository.findByTypeIdAndStatus(typeId,1);
    }
}
