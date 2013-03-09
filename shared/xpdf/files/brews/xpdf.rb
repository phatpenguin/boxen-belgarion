require 'formula'

class Xpdf < Formula
  homepage 'http://www.foolabs.com/xpdf/'
  url 'ftp://ftp.foolabs.com/pub/xpdf/xpdf-3.03.tar.gz'
  sha1 '499423e8a795e0efd76ca798239eb4d0d52fe248'

  version '3.03-boxen1'

  depends_on 'lesstif'
  depends_on :x11

  # see: http://gnats.netbsd.org/45562
  def patches; DATA; end

  def install
    ENV.append_to_cflags "-I#{MacOS.x11_prefix}/include -I#{MacOS.x11_prefix}/include/freetype2 -I#{HOMEBREW_PREFIX}/include"

    system "./configure", "--prefix=#{prefix}", "--mandir=#{man}"
    system "make"
    system "make install"
  end
end

__END__
diff --git a/xpdf/XPDFViewer.cc b/xpdf/XPDFViewer.cc
index 2de349d..e6ef7fa 100644
--- a/xpdf/XPDFViewer.cc
+++ b/xpdf/XPDFViewer.cc
@@ -1803,7 +1803,7 @@ void XPDFViewer::initToolbar(Widget parent) {
   menuPane = XmCreatePulldownMenu(toolBar, "zoomMenuPane", args, n);
   for (i = 0; i < nZoomMenuItems; ++i) {
     n = 0;
-    s = XmStringCreateLocalized(zoomMenuInfo[i].label);
+    s = XmStringCreateLocalized((char *)zoomMenuInfo[i].label);
     XtSetArg(args[n], XmNlabelString, s); ++n;
     XtSetArg(args[n], XmNuserData, (XtPointer)i); ++n;
     sprintf(buf, "zoom%d", i);
