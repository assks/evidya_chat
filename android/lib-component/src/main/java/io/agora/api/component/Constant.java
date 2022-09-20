package io.agora.api.component;

import android.annotation.SuppressLint;
import android.view.TextureView;

//import io.agora.rtc.RtcEngine;
import io.agora.rtc2.RtcEngine;


public class Constant {

    @SuppressLint("StaticFieldLeak")
    public static TextureView TEXTUREVIEW;

    public static RtcEngine ENGINE;

    public static String TIPS = "tips";

    public static String DATA = "data";

    public static final String URL_PLAY_AUDIO_FILES = "https://webdemo.agora.io/mTrack.m4a";
    public static final String EFFECT_FILE_PATH = "/assets/effectA.wav";

    public static final String WATER_MARK_FILE_PATH = "/assets/agora-logo.png";
}
