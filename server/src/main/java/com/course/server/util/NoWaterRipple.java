package com.course.server.util;

import com.google.code.kaptcha.GimpyEngine;
import com.google.code.kaptcha.util.Configurable;

import java.awt.*;
import java.awt.image.BufferedImage;
import java.awt.image.ImageObserver;

public class NoWaterRipple extends Configurable implements GimpyEngine {

    public NoWaterRipple() { }

    @Override
    public BufferedImage getDistortedImage(BufferedImage baseImage) {
//        NoiseProducer noiseProducer = this.getConfig().getNoiseImpl();
        BufferedImage distoredImage = new BufferedImage(baseImage.getWidth(),baseImage.getHeight(),2);
        Graphics2D graphics = (Graphics2D) distoredImage.getGraphics();
        graphics.drawImage(baseImage,0,0,(Color) null,(ImageObserver) null);
        graphics.dispose();
        return distoredImage;
    }
}
