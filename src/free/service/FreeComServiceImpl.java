package free.service;

import java.util.List;

import free.dao.FreeComDaoImpl;
import free.dao.IFreeComDao;
import free.vo.FComVO;

public class FreeComServiceImpl implements IFreeComService {

	private IFreeComDao fcdao;
	private static IFreeComService fcservice;
	
	private  FreeComServiceImpl() {
		fcdao = FreeComDaoImpl.getinstance();
	}
	
	public static IFreeComService getinstance() {
		if(fcservice == null) {
			fcservice = new FreeComServiceImpl();
		}
		return fcservice;
	}
	
	
	@Override
	public int registFreeCom(FComVO fcv) {
		return fcdao.insertFreeCom(fcv);
	}

	@Override
	public boolean checkFreeCom(String memId) {
		return fcdao.checkFreeCom(memId);
	}

	@Override
	public FComVO getMemId(String memId) {
		return fcdao.getMemId(memId);
	}

	@Override
	public FComVO getFreeCom(int fNo) {
		return fcdao.getFreeCom(fNo);
	}

	@Override
	public int modifyFreeCom(FComVO fcv) {
		return fcdao.updateFreeCom(fcv);
	}

	@Override
	public int removeFreeCom(String memId) {
		return fcdao.deleteFreeCom(memId);
	}

	@Override
	public List<FComVO> listAllFreeCom() {
		return fcdao.selectAllFreeComVO();
	}

	@Override
	public List<FComVO> searchFreeCom(FComVO fcv) {
		return fcdao.searchFreeComVO(fcv);
	}

	@Override
	public int removeFreeCom(int fNo) {
		return fcdao.deleteFreeCom(fNo);
	}

	@Override
	public List<FComVO> getFreeComList(int fNo) {
		return fcdao.getFreeComList(fNo);
	}

}
