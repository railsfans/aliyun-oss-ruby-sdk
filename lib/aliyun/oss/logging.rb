# -*- encoding: utf-8 -*-

require 'logger'

module Aliyun
  module OSS
    ##
    # Logging support
    # @example
    #   include Logging
    #   logger.info(xxx)
    module Logging

      DEFAULT_LOG_FILE = "./oss_sdk.log"

      # level = Logger::DEBUG | Logger::INFO | Logger::ERROR | Logger::FATAL
      def self.set_log_level(level)
        Logging.logger.level = level
      end

      # 设置日志输出的文件
      def self.set_log_file(file)
        @@log_file = file
      end

      # 获取logger
      def logger
        Logging.logger
      end

      private

      def self.logger
        unless @logger
          @logger = Logger.new(@@log_file ||= DEFAULT_LOG_FILE)
          @logger.level = Logger::INFO
        end
        @logger
      end

    end # logging
  end # OSS
end # Aliyun