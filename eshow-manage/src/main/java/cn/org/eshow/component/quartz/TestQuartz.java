package cn.org.eshow.component.quartz;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * Test Quartz
 *
 * @author leida
 */
public class TestQuartz {

    private static final Log log = LogFactory.getLog(TestQuartz.class);

    public static void main(String[] args) {
        log.info("quartz is start!");
    }

    /**
     * 定时更新演示
     */
    public void update() {
        log.info("update quartz is working!");
    }

}
