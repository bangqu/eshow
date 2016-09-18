package cn.org.eshow.util;

import org.jsoup.Jsoup;
import org.jsoup.nodes.*;
import org.jsoup.parser.Tag;

import java.util.List;

/**
 * Utility class to espace HTML chars and other HTML related stuff can be added in the future.
 * 
 * @author legend
 */
public final class JsoupUtil {

	/**
	 * 截取字符串长字，保留HTML格式
	 * 
	 * @param content
	 * @param len 字符长度
	 * @author jimmy
	 */
	public static String truncateHTML(String content, int len) {
		Document dirtyDocument = Jsoup.parse(content);
		Element source = dirtyDocument.body();
		Document clean = Document.createShell(dirtyDocument.baseUri());
		Element dest = clean.body();
		truncateHTML(source, dest, len);
		return dest.outerHtml().replace("<body>", "").replace("</body>", "");
	}

	/**
	 * 使用Jsoup预览
	 * 
	 * @param source 需要过滤的
	 * @param dest 过滤后的对象
	 * @param len 截取字符长度
	 * @author jimmy <br />
	 *         eg.<br />
	 * 
	 *         Document dirtyDocument = Jsoup.parse(sb.toString());<br />
	 *         Element source = dirtyDocument.body();<br />
	 *         Document clean = Document.createShell(dirtyDocument.baseUri());<br />
	 *         Element dest = clean.body();<br />
	 *         int len = 6;<br />
	 *         truncateHTML(source,dest,len);<br />
	 *         System.out.println(dest.html());<br />
	 */
	private static void truncateHTML(Element source, Element dest, int len) {
		List<Node> sourceChildren = source.childNodes();
		for (Node sourceChild : sourceChildren) {
			if (sourceChild instanceof Element) {
				Element sourceEl = (Element) sourceChild;
				Element destChild = createSafeElement(sourceEl);
				int txt = dest.text().length();
				if (txt >= len) {
					break;
				} else {
					len = len - txt;
				}
				dest.appendChild(destChild);
				truncateHTML(sourceEl, destChild, len);
			} else if (sourceChild instanceof TextNode) {
				int destLeng = dest.text().length();
				if (destLeng >= len) {
					break;
				}
				TextNode sourceText = (TextNode) sourceChild;
				int txtLeng = sourceText.getWholeText().length();
				if ((destLeng + txtLeng) > len) {
					int tmp = len - destLeng;
					String txt = sourceText.getWholeText().substring(0, tmp) + "...";
					TextNode destText = new TextNode(txt, sourceChild.baseUri());
					dest.appendChild(destText);
					break;
				} else {
					TextNode destText = new TextNode(sourceText.getWholeText(), sourceChild
							.baseUri());
					dest.appendChild(destText);
				}
			}
		}
	}

	/**
	 * 按原Element重建一个新的Element
	 * 
	 * @param sourceEl
	 * @return
	 * @author jimmy
	 */
	private static Element createSafeElement(Element sourceEl) {
		String sourceTag = sourceEl.tagName();
		Attributes destAttrs = new Attributes();
		Element dest = new Element(Tag.valueOf(sourceTag), sourceEl.baseUri(), destAttrs);
		Attributes sourceAttrs = sourceEl.attributes();
		for (Attribute sourceAttr : sourceAttrs) {
			destAttrs.put(sourceAttr);
		}
		return dest;
	}

	public static void main(String[] args) throws Exception {

		System.out.println(JsoupUtil.truncateHTML(HtmlUtil.getContent("http://192.168.1.144:8080/shangpinku/api/product/search.json?id=1", "utf-8"), 400));
	}

}
